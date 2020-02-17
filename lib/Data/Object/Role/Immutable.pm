package Data::Object::Role::Immutable;

use 5.014;

use strict;
use warnings;
use routines;

use Moo::Role;
use Readonly;

# VERSION

# METHODS

method immutable() {
  if (UNIVERSAL::isa($self, 'HASH')) {
    Readonly::Hash(%$self, %$self);
  }
  if (UNIVERSAL::isa($self, 'ARRAY')) {
    Readonly::Array(@$self, @$self);
  }
  if (UNIVERSAL::isa($self, 'SCALAR')) {
    Readonly::Scalar($$self, $$self);
  }

  return $self;
}

1;
