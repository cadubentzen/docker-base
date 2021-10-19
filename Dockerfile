FROM alpine:3.14
LABEL maintainer="contact@convos.chat"

RUN apk add --no-cache curl openssl perl perl-io-socket-ssl perl-net-ssleay wget && \
    apk add --no-cache --virtual builddeps build-base perl-dev

ADD https://cpanmin.us/ /bin/cpanm
RUN chmod 0755 /bin/cpanm

RUN /bin/cpanm -n -M https://cpan.metacpan.org \
  Module::Install      \
  Cpanel::JSON::XS     \
  Crypt::Eksblowfish   \
  DBD::SQLite          \
  EV                   \
  File::HomeDir        \
  File::ReadBackwards  \
  HTTP::AcceptLanguage \
  Hailo                \
  IO::Socket::Socks    \
  IRC::Utils           \
  Math::Calc::Parser   \
  Net::LDAP            \
  Parse::IRC           \
  Text::Markdown       \
  Time::Piece          \
  Unicode::UTF8

CMD ["sh"]
