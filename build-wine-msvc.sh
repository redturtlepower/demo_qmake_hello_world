PROJECT_NAME=helloworld

DATE=`date '+%Y-%m-%d_%H-%M-%S'`
GIT_LOG=`git --git-dir ./../ log -1`
# commit a39c68c4741639d4189b7ed4axd87b234b210797 (HEAD -> master, origin/master, origin/HEAD)
# Author: John Doe <a@b.com>
# Date: Sun Jun 3 00:35:34 2018 +0200
COMMIT=`echo $GIT_LOG | cut -c7-47` # 'a39c68c4741639d4189b7ed4axd87b234b210797'
LINE_DATE=`echo $GIT_LOG | sed -n 2p`
echo 'line date: %LINE_DATE'
COMMIT_DATE=`echo $LINE_DATE | cut -c10-25` # 'Jun 3 00:35:34 2018 +0200'
COMMIT_DATE=`echo $COMMIT_DATE | sed 's/:/ /'` # Replace : with space
COMMIT_DATE=`echo $COMMIT_DATE | sed 's/ /-/'` # Replace space with -

#mkdir build
#cd build
BUILD_DIR=/var/artifacts/rusche/${PROJECT_NAME}/${COMMIT}_${COMMIT_DATE}_${BUILD_DATE}
echo 'Building in dir $BUILD_DIR'
mkdir -p $BUILD_DIR

# in wine, linux root folder is mapped to Z:
BUILD_DIR='Z:${BUILD_DIR}'
# Create build-bat-file by replacing placeholders from template:
sed "s/__BUILD_DIR__/`echo $BUILD_DIR`/" ~/.wine/drive_c/buildenv/1-build-src.bat.template > ~/.wine/drive_c/buildenv/1-build-src.generated.bat
# Use pro-file name of this project (helloworld):
sed -i "s/__PRO_FILE_NAME__/`echo ${PROJECT_NAME}`/g" ~/.wine/drive_c/buildenv/1-build-src.generated.bat


# Copy all the files  
# of the directory that contains the helloworld.pro-file
# into folder '~/.wine/drive_c/buildenv/app'!
rm -rf ~/.wine/drive_c/buildenv/app/*
SRC_DIR=/home/jenkins/workspace/${PROJECT_NAME}
rm -rf ${SRC_DIR}/.git/
cp -R ${SRC_DIR}/. ~/.wine/drive_c/buildenv/app/

# Run the bat file in the context of windows via wine:
wine ~/.wine/drive_c/buildenv/1-build-src.generated.bat