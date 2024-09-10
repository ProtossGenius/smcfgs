# install cargo

curl https://sh.rustup.rs -sSf | sh

# init cargo env in any env file .profile/.base_profile/...
# set CARGO_HOME for cargo env
# set target-cpu=native feature to let rustc generate and optimize code for the CPU running the compiler.
echo 'CARGO_HOME=/root/cargo' >> ~/.profile
echo 'RUSTFLAGS="-C target-cpu=native"' >> ~/.profile
source ~/.profile

