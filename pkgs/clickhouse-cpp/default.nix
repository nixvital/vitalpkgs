{ lib, stdenv, cmake }:

# TODO(breakds): Merge this to upstream.
stdenv.mkDerivation rec {
  pname = "clickhouse-cpp";
  version = "1.5.0";

  src = builtins.fetchTarball {
    url = "https://github.com/ClickHouse/clickhouse-cpp/archive/refs/tags/${version}.tar.gz";
    sha256 = "1kpjvjwixmg5m6iha9n2hvm5vbm6ww5c5x7p4ixw4s08jms4yh2s";
  };

  nativeBuildInputs = [ cmake ];

  patches = [
    ./0001-Install-cmake-files-in-build-artifacts-as-well.patch
  ];

  meta = with lib; {
    homepage = "https://github.com/ClickHouse/clickhouse-cpp";
    description = "C++ client library for ClickHouse";
    platforms = with platforms; linux ++ darwin;
    license = licenses.asl20;
  };
}
