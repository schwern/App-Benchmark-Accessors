#!/usr/bin/env perl

use warnings;
use strict;
use App::Benchmark ':all';
use App::Benchmark::Accessors;

my $iterations = shift;
$iterations ||= 2_000_000;

my $Moose                    = WithMoose->new;
my $MooseImmutable           = WithMooseImmutable->new;
my $Mouse                    = WithMouse->new;
my $ClassAccessor            = WithClassAccessor->new;
my $ClassAccessorFast        = WithClassAccessorFast->new;
my $ClassAccessorFastXS      = WithClassAccessorFastXS->new;
my $ClassAccessorComplex     = WithClassAccessorComplex->new;
my $ClassAccessorConstructor = WithClassAccessorConstructor->new;
my $Mojo                     = WithMojo->new;
my $ClassMethodMaker         = WithClassMethodMaker->new;
my $Accessors                = WithAccessors->new;
my $Spiffy                   = WithSpiffy->new;
my $ClassSpiffy              = WithClassSpiffy->new;

benchmark_diag($iterations, {
    moose =>
        sub { $Moose->myattr(27) },
    moose_immutable =>
        sub { $MooseImmutable->myattr(27) },
    mouse =>
        sub { $Mouse->myattr(27) },
    class_accessor =>
        sub { $ClassAccessor->myattr(27) },
    class_accessor_fast =>
        sub { $ClassAccessorFast->myattr(27) },
    class_accessor_fast_xs =>
        sub { $ClassAccessorFastXS->myattr(27) },
    class_accessor_complex =>
        sub { $ClassAccessorComplex->myattr(27) },
    class_accessor_constructor =>
        sub { $ClassAccessorConstructor->myattr(27) },
    mojo =>
        sub { $Mojo->myattr(27) },
    class_methodmaker =>
        sub { $ClassMethodMaker->myattr(27) },
    accessors =>
        sub { $Accessors->myattr(27) },
    spiffy =>
        sub { $Spiffy->myattr(27) },
    class_spiffy =>
        sub { $ClassSpiffy->myattr(27) },
});
