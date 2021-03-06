cd $sm_programs && git clone  https://gitee.com/ProtossGenius/FFmpeg.git
cd FFmpeg && ./configure --enable-shared --prefix=/xxx/ffmpeg --enable-libmp3lame
make 
make install
echo  "/xxx/ffmpeg/lib" >> /etc/ld.so.conf.d/ffmpeg.conf
ldconfig
echo "export FFMPEG_HOME=/data/programs/FFmpeg" >> /etc/profile.d/ffmpeg.sh  
echo "export PATH=\$FFMPEG_HOME:\$PATH" >> /etc/profile.d/ffmpeg.sh
source /etc/profile.d/ffmpeg.sh
