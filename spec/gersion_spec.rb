require_relative 'spec_helper'

describe Gersion do

  describe "current version" do

    before do
      Gersion::Bash.stubs(:run)
        .with('git tag --points-at HEAD')
        .returns head_tag_check_result
    end

    describe "the current version is bound to a tag" do

      let(:tag) { random_string }

      let(:head_tag_check_result) { "#{tag}\n#{random_string}" }

      it "should return the tag" do
        Gersion.current_version.must_equal tag
      end

    end

    describe "the current version is NOT bound to a tag" do

      let(:head_tag_check_result) { "" }

      describe "but it has a current sha key" do

        let(:sha) { random_string }

        before do
          Gersion::Bash.stubs(:run)
            .with('git rev-list -1 HEAD')
            .returns "#{sha}\n#{random_string}"
        end

        it "should return the sha" do
          Gersion.current_version.must_equal sha
        end

      end

    end

  end

  describe "version of" do

    let(:gemlock_contents) do
<<EOF

GIT
  remote: git@github.com:sdfsdlkfjs/abc.git
  revision: 6eab6b7c3774ac63cc719c8af2ded6d447d0a378
  specs:
    abc (0.0.1)
      json
      pusher (~> 0.12.0)
      ruby-hmac

GIT
  remote: git@github.com:slkdjfslkj/oiu.git
  revision: dadafa1c0acd8d734e9d9b95b13cf76d4ac52c1a
  tag: 1.0.0
  specs:
    oiu (0.0.1)
      activerecord-postgres-hstore
      rails (>= 4.1.7)

GIT
  remote: git@github.com:asdfsfwerwer/tyu.git
  revision: 37415d2415a1119d4fcb225d222e25f4b709d74c
  specs:
    tyu (0.0.1)
      activesupport
      savon
      xml_hate (>= 2.0.0)

GIT
  remote: git@github.com:zsdfsfsdsdf/qwerty.git
  revision: 94fb92ff25f149d089be3cc069ca93ac8410b624
  tag: 4.0.1
  specs:
    qwerty (0.9.0)
      browser
      rails (~> 4.1.7)
      sidekiq

GIT
  remote: https://github.com/sdkfjsdlkfjsd/sdfe.git
  revision: 0a083460751d6a7eac261ff03f9df17eceb5ce98
  specs:
    sdfe (1.2.2)
      rack-mobile-detect
      rails

GIT
  remote: https://github.com/darrencauthon/bnm.git
  revision: 2d26a805c09647ffae9d0d4272748ba369d009b1
  specs:
    bnm (0.7.7)
      activerecord (>= 3.1)
      pg-hstore (>= 1.1.5)
      rake

GEM
  remote: https://rubygems.org/
  specs:
    Ascii85 (1.0.2)
    actionmailer (4.1.7)
      actionpack (= 4.1.7)
      actionview (= 4.1.7)
      mail (~> 2.5, >= 2.5.4)
    actionpack (4.1.7)
      actionview (= 4.1.7)
      activesupport (= 4.1.7)
      rack (~> 1.5.2)
      rack-test (~> 0.6.2)
    actionview (4.1.7)
      activesupport (= 4.1.7)
      builder (~> 3.1)
      erubis (~> 2.7.0)
    activemodel (4.1.7)
      activesupport (= 4.1.7)
      builder (~> 3.1)
    activerecord (4.1.7)
      activemodel (= 4.1.7)
      activesupport (= 4.1.7)
      arel (~> 5.0.0)
    activesupport (4.1.7)
      i18n (~> 0.6, >= 0.6.9)
      json (~> 1.7, >= 1.7.7)
      minitest (~> 5.1)
      thread_safe (~> 0.1)
      tzinfo (~> 1.1)
    addressable (2.3.8)
    afm (0.2.2)
    akami (1.2.2)
      gyoku (>= 0.4.0)
      nokogiri
    amq-protocol (1.9.2)
    ansi (1.4.3)
    arel (5.0.1.20140414130214)
    autoparse (0.3.3)
      addressable (>= 2.3.1)
      extlib (>= 0.9.15)
      multi_json (>= 1.0.0)
    awesome_print (1.2.0)
    aws-sdk (1.58.0)
      aws-sdk-v1 (= 1.58.0)
    aws-sdk-v1 (1.58.0)
      json (~> 1.4)
      nokogiri (>= 1.4.4)
    babosa (0.3.11)
    bcrypt (3.1.7)
    bcrypt-ruby (3.1.5)
      bcrypt (>= 3.1.3)
    better_errors (2.0.0)
      coderay (>= 1.0.0)
      erubis (>= 2.6.6)
      rack (>= 0.9.0)
    binding_of_caller (0.7.2)
      debug_inspector (>= 0.0.1)
    blankslate (3.1.3)
    browser (1.0.1)
    bson (2.3.0)
    builder (3.2.2)
    bunny (0.9.0.pre13)
      amq-protocol (>= 1.6.0)
    callsite (0.0.11)
    celluloid (0.17.1.2)
      bundler
      celluloid-essentials
      celluloid-extras
      celluloid-fsm
      celluloid-pool
      celluloid-supervision
      dotenv
      nenv
      rspec-logsplit (>= 0.1.2)
      timers (>= 4.1.1)
    celluloid-essentials (0.20.2.1)
      bundler
      dotenv
      nenv
      rspec-logsplit (>= 0.1.2)
      timers (>= 4.1.1)
    celluloid-extras (0.20.1)
      bundler
      dotenv
      nenv
      rspec-logsplit (>= 0.1.2)
      timers (>= 4.1.1)
    celluloid-fsm (0.20.1)
      bundler
      dotenv
      nenv
      rspec-logsplit (>= 0.1.2)
      timers (>= 4.1.1)
    celluloid-pool (0.20.1)
      bundler
      dotenv
      nenv
      rspec-logsplit (>= 0.1.2)
      timers (>= 4.1.1)
    celluloid-supervision (0.20.1.1)
      bundler
      dotenv
      nenv
      rspec-logsplit (>= 0.1.2)
      timers (>= 4.1.1)
    chronic (0.10.2)
    coderay (1.1.0)
    connection_pool (2.2.0)
    contrast (1.1.0)
      awesome_print
      subtle
    crack (0.4.2)
      safe_yaml (~> 1.0.0)
    daemons (1.1.9)
    debug_inspector (0.0.2)
    devise (3.4.1)
      bcrypt (~> 3.0)
      orm_adapter (~> 0.1)
      railties (>= 3.2.6, < 5)
      responders
      thread_safe (~> 0.1)
      warden (~> 1.2.3)
    domain_name (0.5.24)
      unf (>= 0.0.5, < 1.0.0)
    dotenv (0.11.1)
      dotenv-deployment (~> 0.0.2)
    dotenv-deployment (0.0.2)
    dragonfly (0.9.15)
      multi_json (~> 1.0)
      rack
    ekg (1.1.1)
    erubis (2.7.0)
    ethon (0.7.1)
      ffi (>= 1.3.0)
    eventmachine (1.0.3)
    excon (0.41.0)
    extlib (0.9.16)
    faraday (0.9.1)
      multipart-post (>= 1.2, < 3)
    ffi (1.9.6)
    filepicker-rails (1.4.0)
      rails (>= 3.2)
    foreman (0.75.0)
      dotenv (~> 0.11.1)
      thor (~> 0.19.1)
    friendly_id (5.0.4)
      activerecord (>= 4.0.0)
    google-api-client (0.8.2)
      activesupport (>= 3.2)
      addressable (~> 2.3)
      autoparse (~> 0.3)
      extlib (~> 0.9)
      faraday (~> 0.9)
      launchy (~> 2.4)
      multi_json (~> 1.10)
      retriable (~> 1.4)
      signet (~> 0.6)
    gyoku (0.4.6)
      builder (>= 2.1.2)
    haml (4.0.5)
      tilt
    hashery (2.1.1)
    hashie (3.4.2)
    hike (1.2.3)
    hitimes (1.2.2)
    htmlentities (4.3.2)
    http-cookie (1.0.2)
      domain_name (~> 0.5)
    httparty (0.13.3)
      json (~> 1.8)
      multi_xml (>= 0.5.2)
    httpclient (2.3.4.1)
    httpi (1.1.1)
      rack
    i18n (0.7.0)
    ice_cube (0.12.1)
    interchangeable (0.0.6)
      terminal-table
    jquery-rails (2.0.3)
      railties (>= 3.1.0, < 5.0)
      thor (~> 0.14)
    json (1.8.3)
    jwt (1.0.0)
    kgio (2.9.2)
    launchy (2.4.3)
      addressable (~> 2.3)
    macaddr (1.7.1)
      systemu (~> 2.6.2)
    mail (2.6.3)
      mime-types (>= 1.16, < 3)
    mandrill-api (1.0.53)
      excon (>= 0.16.0, < 1.0)
      json (>= 1.7.7, < 2.0)
    mandrill-rails (1.3.0)
      activesupport (>= 3.0.3)
    mechanize (2.7.3)
      domain_name (~> 0.5, >= 0.5.1)
      http-cookie (~> 1.0)
      mime-types (~> 2.0)
      net-http-digest_auth (~> 1.1, >= 1.1.1)
      net-http-persistent (~> 2.5, >= 2.5.2)
      nokogiri (~> 1.4)
      ntlm-http (~> 0.1, >= 0.1.1)
      webrobots (>= 0.0.9, < 0.2)
    meta_request (0.3.4)
      callsite (~> 0.0, >= 0.0.11)
      rack-contrib (~> 1.1)
      railties (>= 3.0.0, < 5.0.0)
    metaclass (0.0.4)
    mime-types (2.6.1)
    mini_portile (0.6.2)
    minitest (5.8.0)
    minitest-focus (1.1.0)
      minitest (>= 4, < 6)
    minitest-rails (2.1.1)
      minitest (~> 5.4)
      railties (~> 4.1)
    minitest-reporters (1.0.7)
      ansi
      builder
      minitest (>= 5.0)
      ruby-progressbar
    mixpanel-ruby (1.6.0)
    mixpanel_client (4.1.1)
      typhoeus (~> 0.6.7)
    mocha (1.1.0)
      metaclass (~> 0.0.1)
    mongoid (4.0.0)
      activemodel (~> 4.0)
      moped (~> 2.0.0)
      origin (~> 2.1)
      tzinfo (>= 0.3.37)
    moped (2.0.1)
      bson (~> 2.2)
      connection_pool (~> 2.0)
      optionable (~> 0.2.0)
    multi_json (1.11.2)
    multi_xml (0.5.5)
    multipart-post (2.0.0)
    nenv (0.2.0)
    net-http-digest_auth (1.4)
    net-http-persistent (2.9.4)
    netrc (0.10.3)
    nokogiri (1.6.6.2)
      mini_portile (~> 0.6.0)
    nori (1.1.5)
    ntlm-http (0.1.1)
    oauth2 (1.0.0)
      faraday (>= 0.8, < 0.10)
      jwt (~> 1.0)
      multi_json (~> 1.3)
      multi_xml (~> 0.5)
      rack (~> 1.2)
    omniauth (1.2.2)
      hashie (>= 1.2, < 4)
      rack (~> 1.0)
    omniauth-google-oauth2 (0.2.6)
      omniauth (> 1.0)
      omniauth-oauth2 (~> 1.1)
    omniauth-oauth2 (1.3.1)
      oauth2 (~> 1.0)
      omniauth (~> 1.2)
    optionable (0.2.0)
    origin (2.1.1)
    orm_adapter (0.5.0)
    panic_board_data (1.0.2)
      json
    pdf-reader (1.3.3)
      Ascii85 (~> 1.0.0)
      afm (~> 0.2.0)
      hashery (~> 2.0)
      ruby-rc4
      ttfunk
    pdfcrowd (2.6.0)
    pg (0.17.1)
    pg-hstore (1.2.0)
    pusher (0.12.0)
      httpclient (~> 2.3.0)
      multi_json (~> 1.0)
      signature (~> 0.1.6)
    rack (1.5.5)
    rack-contrib (1.2.0)
      rack (>= 0.9.1)
    rack-mobile-detect (0.4.0)
      rack
    rack-plastic (0.1.3)
      nokogiri (~> 1.4)
      rack (~> 1.0)
    rack-protection (1.5.3)
      rack
    rack-rewrite (1.5.0)
    rack-test (0.6.3)
      rack (>= 1.0)
    rails (4.1.7)
      actionmailer (= 4.1.7)
      actionpack (= 4.1.7)
      actionview (= 4.1.7)
      activemodel (= 4.1.7)
      activerecord (= 4.1.7)
      activesupport (= 4.1.7)
      bundler (>= 1.3.0, < 2.0)
      railties (= 4.1.7)
      sprockets-rails (~> 2.0)
    railties (4.1.7)
      actionpack (= 4.1.7)
      activesupport (= 4.1.7)
      rake (>= 0.8.7)
      thor (>= 0.18.1, < 2.0)
    raindrops (0.13.0)
    rake (10.4.2)
    redis (3.2.1)
    redis-namespace (1.5.2)
      redis (~> 3.0, >= 3.0.4)
    responders (1.1.2)
      railties (>= 3.2, < 4.2)
    rest-client (1.8.0)
      http-cookie (>= 1.0.2, < 2.0)
      mime-types (>= 1.16, < 3.0)
      netrc (~> 0.7)
    retriable (1.4.1)
    routing-filter (0.3.1)
      actionpack
    rspec-logsplit (0.1.3)
    ruby-hmac (0.4.0)
    ruby-progressbar (1.7.0)
    ruby-rc4 (0.1.5)
    rubyXL (3.2.6)
      nokogiri (>= 1.4.4)
      rubyzip (>= 1.1.6)
    rubyzip (1.1.6)
    safe_yaml (1.0.4)
    savon (1.2.0)
      akami (~> 1.2.0)
      builder (>= 2.1.2)
      gyoku (~> 0.4.5)
      httpi (~> 1.1.0)
      nokogiri (>= 1.4.0)
      nori (~> 1.1.0)
      wasabi (~> 2.5.0)
    seam (1.1.3)
      activesupport
      i18n
      json
    seam-active_record (1.1.0)
      seam
    seam-sidekiq (1.1.0)
      seam
    seo_meta (1.3.0)
      railties (>= 3.0.0)
    sidekiq (2.16.0)
      celluloid (>= 0.15.2)
      connection_pool (>= 1.0.0)
      json
      redis (>= 3.0.4)
      redis-namespace (>= 1.3.1)
    sidekiq-failures (0.4.3)
      sidekiq (>= 2.16.0)
    sidetiq (0.6.1)
      celluloid (>= 0.14.1)
      ice_cube (~> 0.12.0)
      sidekiq (>= 2.16.0)
    signature (0.1.7)
    signet (0.6.0)
      addressable (~> 2.3)
      extlib (~> 0.9)
      faraday (~> 0.9)
      jwt (~> 1.0)
      multi_json (~> 1.10)
    sinatra (1.4.5)
      rack (~> 1.4)
      rack-protection (~> 1.4)
      tilt (~> 1.3, >= 1.3.4)
    slim (2.1.0)
      temple (~> 0.6.9)
      tilt (>= 1.3.3, < 2.1)
    source_code (0.1.0)
    sprockets (2.12.4)
      hike (~> 1.2)
      multi_json (~> 1.0)
      rack (~> 1.0)
      tilt (~> 1.1, != 1.3.0)
    sprockets-rails (2.3.2)
      actionpack (>= 3.0)
      activesupport (>= 3.0)
      sprockets (>= 2.8, < 4.0)
    stripe (1.25.0)
      json (~> 1.8.1)
      rest-client (~> 1.4)
    strong_password (0.0.4)
    subtle (1.2.0)
      blankslate
    systemu (2.6.4)
    temple (0.6.10)
    terminal-table (1.4.5)
    thor (0.19.1)
    thread_safe (0.3.5)
    three (1.1.0)
    tilt (1.4.1)
    timecop (0.7.1)
    timers (4.1.1)
      hitimes
    tinymce-rails (4.2.4)
      railties (>= 3.1.1)
    tinymce-rails-imageupload (4.0.16.beta)
      railties (>= 3.2, < 5)
      tinymce-rails (~> 4.0)
    truncate_html (0.5.5)
    ttfunk (1.4.0)
    twilio-ruby (3.13.1)
      builder (>= 2.1.2)
      jwt (~> 1.0.0)
      multi_json (>= 1.3.0)
    typhoeus (0.6.9)
      ethon (>= 0.7.1)
    tzinfo (1.2.2)
      thread_safe (~> 0.1)
    unf (0.1.4)
      unf_ext
    unf_ext (0.0.7.1)
    unicorn (4.8.3)
      kgio (~> 2.6)
      rack
      raindrops (~> 0.7)
    uuid (2.3.7)
      macaddr (~> 1.0)
    valid_email2 (1.1.6)
      activemodel (>= 3.2)
      mail (~> 2.5)
    venn (0.0.1)
    warden (1.2.3)
      rack (>= 1.0)
    wasabi (2.5.1)
      httpi (~> 1.0)
      nokogiri (>= 1.4.0)
    webmock (1.20.3)
      addressable (>= 2.3.6)
      crack (>= 0.3.2)
    webrobots (0.1.1)
    whenever (0.9.4)
      chronic (>= 0.6.3)
    will_paginate (3.0.7)
    xml-simple (1.1.5)
    xml_hate (2.0.0)
      activesupport
      hashie
      xml-simple
    yell (2.0.5)
    zip (2.0.2)

PLATFORMS
  ruby

DEPENDENCIES
  activerecord-postgres-hstore!
  ajax-datatables-rails!
  aws-sdk
  babosa (= 0.3.11)
  bcrypt (= 3.1.7)
  bcrypt-ruby (= 3.1.5)
  better_errors

EOF

    end

    before do
      Gersion::File.stubs(:read).with('Gemfile.lock').returns gemlock_contents
    end

    it "should be able to pick out the version of rails" do
      Gersion.version_of('rails').must_equal '4.1.7'
    end

    it "should be able to pick out the version of zip" do
      Gersion.version_of('zip').must_equal '2.0.2'
    end

    describe "picking out the tag as a version" do
      it "should be able to pick out the tag for oiu" do
        Gersion.version_of('oiu').must_equal '1.0.0'
      end
    end

  end

end
