extends Node3D

#class_name SignalManager

func emit_interaction(signal_name, emitter, interaction):
	emitter.emit_signal(signal_name, interaction)
