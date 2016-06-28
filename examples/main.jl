using SignalSlot: Signal, connect, emit, is_connected, disconnect

function myslot01(args...; kwargs...)
    println("myslot01 with $args and $kwargs")
end

function myslot02(args...; kwargs...)
    println("myslot02 with $args and $kwargs")
end

function myslot03(a,b; x=-1, y=-1)
    println("myslot03 with a=$a b=$b x=$x y=$y")
end


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
