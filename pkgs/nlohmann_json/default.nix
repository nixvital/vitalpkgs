{ lib, stdenv, fetchFromGitHub, cmake
}:

stdenv.mkDerivation rec {
  pname = "nlohmann_json";
  version = "3.9.1";

  src = fetchFromGitHub {
    owner = "nlohmann";
    repo = "json";
    rev = "v${version}";
    sha256 = "0ar4mzp53lskxw3vdzw07f47njcshl3lwid9jfq6l7yx6ds2nyjc";
  };

  nativeBuildInputs = [ cmake ];

  enableParallelBuilding = true;

  cmakeFlags = [
    "-DBuildTests=${if doCheck then "ON" else "OFF"}"
    "-DJSON_MultipleHeaders=ON"
  ];

  # A test cause the build to timeout https://github.com/nlohmann/json/issues/1816
  #doCheck = stdenv.hostPlatform == stdenv.buildPlatform;
  doCheck = false;

  postInstall = "rm -rf $out/lib64";

  meta = with lib; {
    description = "Header only C++ library for the JSON file format";
    homepage = "https://github.com/nlohmann/json";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
