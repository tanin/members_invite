# README

- API:
  * POST /api/v1/members
    - create member:
    [members request spec](spec/requests/api/v1/members_spec.rb)
  * GET: /api/v1/members
    - get members collection:
    [members request spec](spec/requests/api/v1/members_spec.rb)
  * POST /api/v1/invites
    - mass create invite:
    [invites request spec](spec/requests/api/v1/invites_spec.rb)
    
- FLOW:
  - Create members
  - Get members 
  - Send mass create invites with an array of member ids and group id (the invitable)
  - [Every hour](config/sidekiq.yml) invitation runner worker ([invitation runner spec](spec/workers/invitation_runner_worker_spec.rb:))
    will run over all "not sent" invites and will enqueue the action workers ([invitation action worker spec](spec/workers/invitation_runner_worker_spec.rb)) with batches of 1000 invite ids. Action workers will send emails ([mailer spec](spec/mailers/member_invite_mailer_spec.rb)) to a group of 1000 members using sendgrid api [sendgrid config](config/initializers/action_mailer.rb).

- NOTES:
  - All requests and responses implement [jsonapi](https://jsonapi.org/) specification.
  - Mass create performed by the [mass invite service object](spec/services/mass_invite_create_spec.rb). It also is being used as a response object and rendered via it's own [serializer](app/serializers/mass_invite_create_serializer.rb) as a response to mass create request.
