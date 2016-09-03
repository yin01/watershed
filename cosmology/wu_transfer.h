//
//  wu_transfer_function.h
//  wu_transfer_function
//
//  Created by Larry on 2/11/16.
//  Copyright (c) 2016 larry. All rights reserved.
//

void TFfit_hmpc(float omega0, float f_baryon, float hubble, float Tcmb,
                int numk, float *k, float *tf_full, float *tf_baryon, float *tf_cdm);