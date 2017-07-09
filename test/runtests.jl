using SignalSlot
using Base.Test

using SignalSlot: Signal, Slot, connect, emit, is_connected, disconnect

myslot01 = Slot((args...; kwargs...) -> begin
    "myslot01"
end)

myslot02 = Slot((args...; kwargs...) -> begin
    "myslot02", args, kwargs
end)

myslot03 = Slot((a,b; x=-1, y=-1) -> begin
    "myslot03", a, b, x,y
end)

my_signal = Signal()
connect(my_signal, myslot01)
connect(my_signal, myslot02)
connect(my_signal, myslot03)
emit(my_signal, 1, 2, x=1, y=2)
@test is_connected(my_signal, myslot01)

disconnect(my_signal, myslot01)
@test !is_connected(my_signal, myslot01)
emit(my_signal, "a", "b")

my_signal_2 = Signal()
connect(my_signal_2, myslot01)
result = emit(my_signal_2)
@test result == "myslot01"
