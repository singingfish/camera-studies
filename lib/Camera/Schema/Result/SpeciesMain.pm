package Camera::Schema::Result::SpeciesMain;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("species_main");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "species_name",
  { data_type => "", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "studies_speciesmains",
  "Camera::Schema::Result::StudiesSpeciesmain",
  { "foreign.speciesmain_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 19:52:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sIy4D44pnc7S1QjPWdz+GQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
