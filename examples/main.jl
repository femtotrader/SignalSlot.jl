using SignalSlot: Signal, Slot, connect, emit, is_connected, disconnect


myslot01 = Slot((args...; kwargs...) -> begin
    println("myslot01 with $args and $kwargs")
end)

myslot02 = Slot((args...; kwargs...) -> begin
    println("myslot02 with $args and $kwargs")
end)

myslot03 = Slot((a,b; x=-1, y=-1) -> begin
    println("myslot03 with a=$a b=$b x=$x y=$y")
end)


my_signal = Signal()

connect(my_signal, myslot01)
connect(my_signal, myslot02)
connect(my_signal, myslot03)

emit(my_signal, 1, 2, x=1, y=2)
connected = is_connected(my_signal, myslot01)
println("is_connected(my_signal, myslot01): $connected")
disconnect(my_signal, myslot01)
connected = is_connected(my_signal, myslot01)
println("is_connected(my_signal, myslot01): $connected")
emit(my_signal, "a", "b")
