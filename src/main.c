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
#include <stdlib.h>
#include <ctype.h>

#include "dummy.h"

int main (int argc, char *argv[]) {
	if (argc == 2) {
		/*
		 * This gasoline engine supposedly accepts
		 * lean to ideal fuel mixture of 65:1 ~ 15:1
		 * grams of air per gram of fuel.
		 */

		int air = atoi(argv[1]);

		if (dummy(air)) {
			return (EXIT_SUCCESS);
		}
	}

	return (EXIT_FAILURE);
}
