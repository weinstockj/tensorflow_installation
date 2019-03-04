mkdir -p downloads
cd ~/downloads
wget https://github.com/bazelbuild/bazel/releases/download/0.21.0/bazel-0.21.0-installer-linux-x86_64.sh
chmod +x bazel-0.21.0-installer-linux-x86_64.sh
./bazel-0.21.0-installer-linux-x86_64.sh --user # will install to $HOME/bin, so check $PATH

git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
git checkout r1.13
./configure # interactive
bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package ~/downloads/tensorflow_pkg
pip install ~/downloads/tensorflow_pkg/tensorflow-1.13.0rc0-cp35-cp35m-linux_x86_64.whl

cd ..
git clone https://github.com/tensorflow/probability.git
cd probability
bazel build --copt=-O3 --copt=-march=native :pip_pkg
PKGDIR=$(mktemp -d)
./bazel-bin/pip_pkg $PKGDIR
pip install --user --upgrade $PKGDIR/*.whl

