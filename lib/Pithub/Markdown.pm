package Pithub::Markdown;

# ABSTRACT: Github v3 Markdown API

use Moo;
use Carp qw(croak);
extends 'Pithub::Base';

=method render

Render an arbitrary Markdown document

    POST /markdown

Example:

    my $response = Pithub::Markdown->render(
        data => {
            text => "Hello world github/linguist#1 **cool**, and #1!",
            context => "github/gollum",
            mode => "gfm",
        },
    );

    # Note that response is NOT in JSON, so ->content will die
    my $html = $response->raw_content;

=cut

sub render {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: data (hashref)' unless defined $args{data};
    return $self->request(
        method => 'POST',
        path   => '/markdown',
        %args,
    );
}

1;
