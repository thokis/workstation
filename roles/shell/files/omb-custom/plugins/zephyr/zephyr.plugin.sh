#! bash oh-my-bash.module

zephyr-env() {
  export ZEPHYR_DIR="$HOME/.development/zepyhr"
  export ZEPHYR_SDK_INSTALL_DIR="$HOME/.sources/zephyr-sdk-0.17.0"

  cd $ZEPHYR_DIR || exit 1
  source "./zephyr/zephyr-env.sh"
  west update
  cd zephyr || exit 1
  git pull --rebase
}
