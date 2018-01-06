#=
A very basic signal / slot library
=#

module SignalSlot


using DataStructures
export Signal, emit, is_connected, disconnect
import Base.connect

struct Slot
    f::Function
end

struct Signal
    slots::OrderedDict{Symbol,Slot}

    Signal() = new(OrderedDict())
end

function emit(signal::Signal, args...; kwargs...)
    last_result = nothing
    for (symb, slot) in signal.slots
        last_result = slot.f(args...; kwargs...)
    end
    last_result
end

function connect(signal::Signal, slot::Slot)
    key = Symbol(slot)
    if !haskey(signal.slots, key)
        signal.slots[key] = slot
    else
        error("slot $slot ever connected to $signal")
    end
end

function is_connected(signal::Signal, slot::Slot)
    Symbol(slot) in keys(signal.slots)
end

function disconnect(signal::Signal, slot::Slot)
    delete!(signal.slots, Symbol(slot))
end


end # module
