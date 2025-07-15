package MyApp::Controller::Echo;
use Mojo::Base 'Mojolicious::Controller';

sub echo {
  my $self = shift;
  my $message = $self->param('message') || 'Hello from Mojo!';
  $self->render(json => { echo => $message });
}

1;
