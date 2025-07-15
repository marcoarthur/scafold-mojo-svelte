package MyApp;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;

  # Serve Svelte's static files
  $self->static->paths->[0] = $self->home->child('public');

  # Add CORS middleware
  $self->hook(after_build_tx => sub {
      my ($tx) = @_;
      $tx->res->headers->header('Access-Control-Allow-Origin' => '*');
      $tx->res->headers->header('Access-Control-Allow-Methods' => 'GET, POST, OPTIONS');
      $tx->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type');
    });

  my $api = $self->routes->under('/v1');
  $api->get('/api/echo')->to('Echo#echo');
}

1;
