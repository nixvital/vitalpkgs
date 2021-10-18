{ lib
, llvmPackages_11
, fetchFromGitHub
, cmake
, curl
, boost17x
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
    (boost17x.override { enablePython = true; extraB2Args = [ " --with-locale stage " ]; })
  ];

  cmakeFlags = [
  ];

  meta = with lib; {
    homepage = "https://github.com/offa/influxdb-cxx";
    description = "InfluxDB C++ client library";
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
    maintainers = [ maintainers.breakds ];
  };
}
