/*
 ============================================================================
 Name        : Jenkins Demonstration
 Author      : Dockeroo
 Version     : 1
 Copyright   : Dockeroo 2017
 Description : Stoichiometric Air/Fuel Mixture
 ============================================================================
 */

#include <stdio.h>

#include "dummy.h"

int dummy (int air) {
	if (air >= MIN_AIR && air <= MAX_AIR) {
		return 1;
	} else {
		return 0;
	}
}