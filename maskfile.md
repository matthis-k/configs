# Manage Configuration

## install

> Everything related to installing packages

### install paru

> Install [paru](https://github.com/morganamilo/paru)

~~~bash
if [[ -z $(pacman -Q paru) ]]; then
    err_log=$(
        sudo pacman -S --needed base-devel
        exit 0
        git clone https://aur.archlinux.org/paru.git
        echo 1
        cd paru
        makepkg -si
        echo 1
    ) if [[ $? ]]; then
        echo $err_log > err.log
        echo "The installation of paru failed, see err.log for more information"
    else
        rm -rf paru
    fi
else
    echo "paru is already installed"
fi
~~~

### install packages

> Install all packages listed in `$MASKFILE_DIR/packages/required` and `$MASKFILE_DIR/packages/recommended` 

**OPTIONS**
* required_only
    * flags: --required
    * desc: Install the packages in `$MASKFILE_DIR/packages/required` 
* confirm
    * flags: -m --manual-confirm
    * desc: Needed in case of conflicts

~~~bash
REQ_FILE_PATH=$MASKFILE_DIR/packages/required
RECOMMENDED_FILE_PATH=$MASKFILE_DIR/packages/recommended

PACKAGES=$(
    [[ -f $REQ_FILE_PATH ]] && cat $REQ_FILE_PATH
    [[ -z $required_only ]] && [[ -f $RECOMMENDED_FILE_PATH ]] && cat $RECOMMENDED_FILE_PATH
)

if [[ ! -z $PACKAGES ]]; then
    paru -Syyu --noconfirm
    if [[ "$confirm" == "true" ]]; then
        paru -S $PACKAGES --needed
    else
        paru -S $PACKAGES --needed --noconfirm
    fi
else
    echo "There are no packages to install"
fi
~~~

## conf

> Everything related to setting up the configuration

### deploy

> Deploy the configuration files

**OPTIONS**
* home\_path
    * flags: -h --home
    * type: string
    * desc: Path to the directory that contains all files that will be relative to `$HOME`. Defaults to the directory of the `$MASKFILE_DIR/home`.
* root\_path
    * flags: -r --root
    * type: string
    * desc: Path to the directory that contains all files with absolute path. Defaults to the directory of the `$MASKFILE_DIR/root`.

~~~bash
HOME_CONF_DIR=${home_path:-$MASKFILE_DIR/home}
ROOT_CONF_DIR=${root_path:-$MASKFILE_DIR/root}

if [ -d $HOME_CONF_DIR ]; then
    for dir in $(ls -a $HOME_CONF_DIR); do
        if [[ ! "$dir" =~ "^.$|^..$" ]]; then
            cp -r $HOME_CONF_DIR/$dir $HOME 
        fi
    done
fi
if [ -d $ROOT_CONF_DIR ]; then
    for dir in $(ls -a $ROOT_CONF_DIR); do
        if [[ ! "$dir" =~ "^.$|^..$" ]]; then
            sudo cp -r $ROOT_CONF_DIR/$dir /
        fi
    done
fi
~~~

### add

> Copies a file to the configuration

**OPTIONS**
* path
    * flags: -p --path
    * type: string
    * desc: Specify the file to use

* file
    * flags: -f --file
    * desc: If set, read from `$path` or `$MASKFILE_DIR/included` if `path` is not set and add all listed files/directories

~~~bash
if [[ ! $file == "true" ]]; then
    [[ -z $path ]] && echo "You need to specify a path using -p or --path" && exit 1
    if [[ -f "$path" ]] && [[ -d "$path" ]]; then
        echo "Could not find file: $path"
        exit 1
    fi
    abs_path=$(realpath $path)
    target=${abs_path#$HOME}
    target_dir=$(dirname $target)

    if [[ $abs_path == $HOME* ]]; then
        mkdir -p $MASKFILE_DIR/home$target_dir
        cp -r $abs_path $MASKFILE_DIR/home$target
    else
        mkdir -p $MASKFILE_DIR/root$target_dir
        cp -r $abs_path $MASKFILE_DIR/root$target
    fi
else
    file=${path:-$MASKFILE_DIR/included}
    [[ ! -f $file ]] && echo "Could not find file: $file" && exit 1
    for included_file in $(cat $file); do
        abs_path=$(eval echo $included_file)
        $MASK conf add -p $abs_path
    done
fi
~~~

### clean

> Cleans up everything except the metadata

~~~bash
rm -rf $MASKFILE_DIR/home
rm -rf $MASKFILE_DIR/root
~~~

### get

> Automatically get the configuration files from the metadata

~~~bash
$MASK conf clean
$MASK conf add -f
~~~
