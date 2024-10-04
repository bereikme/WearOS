@ECHO OFF
@REM ******************************************************************************
@REM
@REM Gradle start up script for Windows
@REM
@REM ******************************************************************************
@IF NOT "%OS%"=="Windows_NT" GOTO legacy_mode
@SETLOCAL
@REM Prevents poisoning by curl.exe, see https://github.com/gradle/gradle/issues/2704
@SET PATH=%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%PATH%
@REM Resolve any "." and ".." in the path to the script, so we have a fixed location we can depend on.
@FOR %%I IN ("%~dp0.") DO SET LAUNCH_DIR=%%~fI
PUSHD %LAUNCH_DIR%
@REM Resolve symlinks to find the real script location, see https://github.com/gradle/gradle/issues/1164
CALL :findSymlink CALL "%~dp0%~nx0"
IF "%SYMLINK%" NEQ "" (
    SET APP_HOME=%SYMLINK%
) ELSE (
    SET APP_HOME=%~dp0
)
@REM The settings in the following environment variables override the default values.
IF NOT "%GRADLE_OPTS%"=="" SET DEFAULT_JVM_OPTS=%GRADLE_OPTS%
SET CLASSPATH=%APP_HOME%gradle/wrapper/gradle-wrapper.jar

@REM Find Java executable
SET JAVA_EXE=java
IF DEFINED JAVA_HOME SET JAVA_EXE=%JAVA_HOME%\bin\java

@REM Start Gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

:findSymlink
EXIT /B
