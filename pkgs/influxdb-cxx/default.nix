{ lib
, llvmPackages_11
, fetchFromGitHub
, cmake
, curl
}:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "influxdb-cpp";
  version = "0.6.7";

  src = fetchFromGitHub {
    owner = "offa";
    repo = "influxdb-cxx";
    rev = "v${version}";
    sha256 = "sha256-9CfjW+NEVGCfV+A0PDy9N6attE2eNdgKBXTzZ3g51FM=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    curl
  ];

  cmakeFlags = [
    "-DINFLUXCXX_WITH_BOOST=OFF"
    "-DINFLUXCXX_TESTING=OFF"
  ];

  meta = with lib; {
    homepage = "https://github.com/offa/influxdb-cxx";
    description = "InfluxDB C++ client library";
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
    maintainers = [ maintainers.breakds ];
  };
}
