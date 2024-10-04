#!/bin/sh
##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
darwin=false
case "$(uname)" in
    Darwin*) darwin=true ;;
esac

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if [ "$darwin" = "false" ] && [ "$MAX_FD" != "maximum" ] ; then
    MAX_FD_LIMIT=$(ulimit -H -n)
    if [ "$?" -eq 0 ] ; then
        if [ "$MAX_FD_LIMIT" != "unlimited" ] && [ "$MAX_FD" -gt "$MAX_FD_LIMIT" ] ; then
            MAX_FD=$MAX_FD_LIMIT
        fi
    fi
    ulimit -n $MAX_FD || warn "Could not set maximum file descriptor limit: $MAX_FD"
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS "-Xdock:name=$APP_NAME""
fi

# Escape application args
save () {
  for i; do
    printf "%s
" "$i" | sed 's/\(["\]\)/\/g'
  done
}

APP_ARGS=$(save "$@")

# Collect all arguments for the java command, following the shell quoting and substitution rules.
exec "$JAVACMD" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain $APP_ARGS
