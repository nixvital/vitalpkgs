{ lib, stdenv, fetchFromGitHub, cmake
}:

stdenv.mkDerivation rec {
  pname = "civetweb";
  version = "1.14";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-6qBsM9zkN838cMtpE3+c7qcrFpZCS/Av7Ch7EWmlnD4=";
  };

  patches = [
    ./00001-remove-build.diff
  ];

  nativeBuildInputs = [
    cmake
  ];

  cmakeFlags = [
    "-DCIVETWEB_BUILD_TESTING=OFF"
    "-DCIVETWEB_ENABLE_WEBSOCKETS=ON"
    "-DCIVETWEB_ENABLE_CXX=ON"
  ];

  outputs = [ "out" "dev" ];  

  meta = {
    description = "Embedded C/C++ web server";
    homepage = "https://github.com/civetweb/civetweb";
    license = [ lib.licenses.mit ];
  };
}
