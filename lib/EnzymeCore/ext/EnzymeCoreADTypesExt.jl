module EnzymeCoreADTypesExt

using EnzymeCore
using EnzymeCore: WithPrimal, NoPrimal, Mode
using ADTypes: AutoEnzyme

"""
    NoPrimal(backend::ADTypes.AutoEnzyme, default_mode::EnzymeCore.Mode)

Return the mode object from `backend` with the primal computation deactivated.
If `backend` doesn't have a specified mode, fall back on `default_mode` instead.
"""
EnzymeCore.NoPrimal(backend::AutoEnzyme{<:Mode}, default_mode::Mode) = NoPrimal(backend.mode)
EnzymeCore.NoPrimal(::AutoEnzyme{Nothing}, default_mode::Mode) = NoPrimal(default_mode)

"""
    WithPrimal(backend::ADTypes.AutoEnzyme, default_mode::EnzymeCore.Mode)

Return the mode object from `backend` with the primal computation activated.
If `backend` doesn't have a specified mode, fall back on `default_mode` instead.
"""
EnzymeCore.WithPrimal(backend::AutoEnzyme{<:Mode}, default_mode::Mode) = WithPrimal(backend.mode)
EnzymeCore.WithPrimal(::AutoEnzyme{Nothing}, default_mode::Mode) = WithPrimal(default_mode)

end
