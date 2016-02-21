[azukiapp/php](http://images.azk.io/#/php)
==================

Base docker image to run **PHP** applications in [`azk`][azk]

[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/azukiapp/php/latest.svg?style=plastic)][imageslayers]
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/azukiapp/php/latest.svg?style=plastic)][imageslayers]

PHP Versions (tags)
---

<versions>
- [`latest`, `5.6`](https://github.com/azukiapp/docker-php/blob/master/5.6/Dockerfile)
</versions>

### Usage with `azk`

Example of using this image with [azk][azk]:

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  "php": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More info about php image: http://images.azk.io/#/php?from=images-azkfile-php
    image: {"docker": "azukiapp/php:5.6"},
    // or use Dockerfile to custimize your image
    //image: {"dockerfile": "./Dockerfile"},
    // Steps to execute before running instances
    provision: [
      "composer install"
    ],
    workdir: "/azk/#{manifest.dir}",
    command: "php -S 0.0.0.0:80",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      "/azk/#{manifest.dir}" : sync("."),
    },
    scalable: {"default": 1},
    http: {
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      http: "80/tcp",
    },
    envs: {
      // set instances variables
      APP_ENV: "development"
    },
  },
});
```

## Extend image with `Dockerfile`

Install more packages:

```dockerfile
# Dockerfile
FROM azukiapp/php:5.6

# install internationalization functions
RUN  apk add --update php-intl \
  && rm -rf /var/cache/apk/* /var/tmp/* \
```

To build the image:

```sh
$ docker build -t azukiapp/php:5.6 .
```

To more packages, access [alpine packages][alpine-packages]

### Usage with `docker`

To run the image and bind to port 80:

```sh
$ docker run -it --name my-app -p 80:80 -v "$PWD":/myapp -w /myapp azukiapp/php:5.6
```

Logs
---

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

"Azuki", "azk" and the Azuki logo are Copyright 2013-2016 Azuki Serviços de Internet LTDA.

**azk** source code is released under [Apache 2 License][LICENSE].

Check LEGAL and LICENSE files for more information.

[azk]: http://azk.io
[alpine-packages]: http://pkgs.alpinelinux.org/

[circle-ci]: https://circleci.com/gh/azukiapp/docker-php
[imageslayers]: https://imagelayers.io/?images=azukiapp/php:latest

[issues]: https://github.com/azukiapp/docker-php/issues
[license]: https://github.com/azukiapp/docker-php/blob/master/LICENSE

