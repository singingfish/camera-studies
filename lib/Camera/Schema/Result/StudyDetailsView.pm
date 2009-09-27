package Camera::Schema::Result::StudyDetailsView;
use warnings;
use strict;
use base qw/DBIx::Class/;
use Camera::Schema::Util;

my $util = Camera::Schema::Util->new;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('speciesbycatch_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition( $util->join_view('study_details', 'studies', 'studies_details', 'details_id' ));

use Camera::Schema::Result::StudyDetails;
use Camera::Schema::Result::Studies;

for my $col (Camera::Schema::Result::StudyDetails->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::StudyDetails->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );

1;
