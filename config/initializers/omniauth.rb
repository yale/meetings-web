Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV.fetch('AUTH0_CLIENT_ID'),
    ENV.fetch('AUTH0_SECRET'),
    ENV.fetch('AUTH0_DOMAIN'),
    callback_path: '/auth/oauth2/callback',
    provider_ignores_state: true,
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end