using EnzymeCore
using EnzymeCore: WithPrimal, NoPrimal
using ADTypes
using Test

@testset "Mode modifiers" begin
    @test WithPrimal(AutoEnzyme(; mode=Forward), Reverse) == ForwardWithPrimal
    @test WithPrimal(AutoEnzyme(; mode=Reverse), Forward) == ReverseWithPrimal
    @test WithPrimal(AutoEnzyme(), Forward) == ForwardWithPrimal
    @test WithPrimal(AutoEnzyme(), Reverse) == ReverseWithPrimal

    @test NoPrimal(AutoEnzyme(; mode=ForwardWithPrimal), Reverse) == Forward
    @test NoPrimal(AutoEnzyme(; mode=ReverseWithPrimal), Forward) == Reverse
    @test NoPrimal(AutoEnzyme(), ForwardWithPrimal) == Forward
    @test NoPrimal(AutoEnzyme(), ReverseWithPrimal) == Reverse
end
