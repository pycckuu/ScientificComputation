function [C_new] = butcher5(C0)
    dt = 0.001;
    k_1 = dt.*rates(C0);
    k_2 = dt.*rates(C0 + 1/4.*k_1);
    k_3 = dt.*rates(C0 + 1/8.*k_1 + 1/8.*k_2);
    k_4 = dt.*rates(C0 - 1/2.*k_2 + k_3);
    k_5 = dt.*rates(C0 + 3/16.*k_1 + 9/16.*k_4);
    k_6 = dt.*rates(C0 - 3/7.*k_1 + 2/7.*k_2 + 12/7.*k_3 - 12/7.*k_4 + 8/7.*k_5);
    C_new = C0 + (7.*k_1 + 32.*k_3 + 12.*k_4 + 32.*k_5 + 7.*k_6)/90;