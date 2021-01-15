import ospaths

echo "Building libRmath"

# Clone
var buildDir = thisDir() / "r-source"
if existsDir(buildDir):
  withDir "r-source/":
    exec "git pull"
    exec "chmod 755 configure"
    exec "./configure"
   
  withDir "r-source/src/nmath/standalone/":
    exec "make"
else:
  exec "git clone https://github.com/SurajGupta/r-source" 
  withDir "r-source/":
    exec "chmod 755 configure"
    exec "./configure"
  withDir "r-source/src/nmath/standalone/":
    exec "make"

# Copy library to $HOME/.nimble/lib

when defined(windows):
  const
    rmathlib = "libRmath.dll"
elif defined(macosx):
  const
    rmathlib = "libRmath.dylib"
else:
  const
    rmathlib = "libRmath.so"
const libdir = getHomeDir() / ".nimble" / "lib"
mkDir(libdir) # No error if exists
cpFile(thisDir() / "r-source" / "src" / "nmath" / "standalone" / rmathlib, libdir / rmathlib)

# Clean up
rmDir("r-source")

# Remind
echo "Please ensure that " & libdir & " is added to the library search path"

