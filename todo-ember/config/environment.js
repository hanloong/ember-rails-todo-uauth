/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'todo-js',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.apiHost = 'http://localhost:3000';
  }


  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
    ENV.apiHost = null;
  }

  if (environment === 'production') {

  }

  ENV['simple-auth'] = {
    routeAfterAuthentication: 'todo',
    authorizer: 'simple-auth-authorizer:oauth2-bearer',
    crossOriginWhitelist: [ '*', ENV.apiHost ]
  };

  ENV['simple-auth-oauth2'] = {
    serverTokenEndpoint:  ENV.apiHost + '/oauth/token',
  };

  return ENV;
};
