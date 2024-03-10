@echo on
echo STARTING TO BUILD ONNX for %PYTHON%
dir
del /s /f /q build
dir
set "ONNX_ML=1"
set CONDA_PREFIX=%LIBRARY_PREFIX%

set CMAKE_BUILD_TYPE=Release
set "CMAKE_ARGS=%CMAKE_ARGS% -DONNX_ML=1"
set "CMAKE_ARGS=%CMAKE_ARGS% -DCMAKE_CXX_STANDARD=17"
set "CMAKE_ARGS=%CMAKE_ARGS% -DONNX_USE_PROTOBUF_SHARED_LIBS=ON"
set "CMAKE_ARGS=%CMAKE_ARGS% -DProtobuf_USE_STATIC_LIBS=OFF"
set "CMAKE_ARGS=%CMAKE_ARGS% -DDONNX_USE_LITE_PROTO=ON"
set "CMAKE_ARGS=%CMAKE_ARGS% -DUSE_MSVC_STATIC_RUNTIME=0"

set "CMAKE_ARGS=%CMAKE_ARGS% -DPYTHON_EXECUTABLE=%PYTHON%"
set "CMAKE_ARGS=%CMAKE_ARGS% -DPYTHON_LIBRARIES=%LIBRARY_LIB%"
set "CMAKE_ARGS=%CMAKE_ARGS% -DPYTHON_INCLUDE_DIRS=%LIBRARY_INC%"
%PYTHON% -m pip install --no-deps --no-build-isolation --ignore-installed --verbose .
