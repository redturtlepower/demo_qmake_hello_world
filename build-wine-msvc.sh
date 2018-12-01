PROJECT_NAME=helloworld

DATE=`date '+%Y-%m-%d_%H-%M-%S'`
echo `git log -1`
# commit a39c68c4741639d4189b7ed4axd87b234b210797 (HEAD -> master, origin/master, origin/HEAD)
# Author: John Doe <a@b.com>
# Date: Sun Jun 3 00:35:34 2018 +0200

# Cut commit from first row:
COMMIT=`echo $(git log -1 | sed -n 1p | cut -c7-47)` # 'a39c68c4741639d4189b7ed4axd87b234b210797'
echo 'commit:' $COMMIT

# Extract the date from the 3rd row:
COMMIT_DATE=$(git log -1 | sed -n 3p | cut -c12-27) # 'Jun 3 00:35:34'
# Remove first space with -, remove next space with _, replace all remaining : with -
COMMIT_DATE=`echo $COMMIT_DATE | sed 's/ /-/' | sed 's/ /_/' | sed 's/:/-/g' `  
# Result: 
# Jun-3_00-35-34
echo 'commit date:' $COMMIT_DATE

#mkdir build
#cd build
#BUILD_DIR=/var/artifacts/rusche/${PROJECT_NAME}/${COMMIT}_${COMMIT_DATE}_${BUILD_DATE}
BUILD_DIR=/var/artifacts/rusche/${PROJECT_NAME}/${COMMIT_DATE}_${COMMIT}
echo 'Building in dir' $BUILD_DIR
mkdir -p $BUILD_DIR

# in wine, linux root folder is mapped to Z:
BUILD_DIR=Z:${BUILD_DIR}
echo "Generating build script..."
# Create build-bat-file by replacing placeholders from template:
sed "s/__BUILD_DIR__/${BUILD_DIR}/g" ~/.wine/drive_c/buildenv/1-build-src.bat.template > ~/.wine/drive_c/buildenv/1-build-src.generated.bat
# Use pro-file name of this project (helloworld):
sed -i "s/__PRO_FILE_NAME__/${PROJECT_NAME}/g" ~/.wine/drive_c/buildenv/1-build-src.generated.bat


# Copy all the files  
# of the directory that contains the helloworld.pro-file
# into folder '~/.wine/drive_c/buildenv/app'!
echo "Copying src from workspace to app-folder..."
rm -rf ~/.wine/drive_c/buildenv/app/*
SRC_DIR=/home/jenkins/workspace/${PROJECT_NAME}
rm -rf ${SRC_DIR}/.git/
cp -R ${SRC_DIR}/. ~/.wine/drive_c/buildenv/app/

# Run the bat file in the context of windows via wine:
# Can't use this on wine directly because this starts a cmd shell,
# and there is no display on docker wine!
# wineconsole ~/.wine/drive_c/buildenv/1-build-src.generated.bat
wineconsole wscript ~/.wine/drive_c/buildenv/start-invisible-bat.vbs