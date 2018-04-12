package main

import (
	"github.com/gladiusio/gladius-node/init/service-manager"
	"github.com/gladiusio/gladius-node/internal/network-daemon"
)

// Main entry-point for the service
func main() {
	// Define some variables
	name, displayName, description :=
		"GladiusEdgeDaemon",
		"Gladius Network (Edge) Daemon",
		"Gladius Network (Edge) Daemon"

	// Run the function "run" in newtworkd as a service
	manager.RunService(name, displayName, description, networkd.Run)
}