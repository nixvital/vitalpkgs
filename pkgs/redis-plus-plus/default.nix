{ lib
, llvmPackages_11
, fetchFromGitHub
, cmake
, hiredis
}:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "redis-plus-plus";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "sewenew";
    repo = "redis-plus-plus";
    rev = version;
    sha256 = "sha256-FLD5rnm1Ovedv4EJZsXjI5z0pH9XkufQ6WYXMNapehs=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ hiredis ];

  cmakeFlags = [
    "-DREDIS_PLUS_PLUS_BUILD_TEST=OFF"
    "-DREDIS_PLUS_PLUS_USE_TLS=OFF"
  ];

  meta = with lib; {
    homepage = "https://github.com/sewenew/redis-plus-plus";
    description = "Redis client written in C++";
    licencse = licenses.asl20;
    platforms = with platforms; linux ++ darwin;
    maintainers = [ maintainers.breakds ];
  };
}
