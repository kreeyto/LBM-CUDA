#ifndef KERNELS_CUH
#define KERNELS_CUH

__global__ void phiCalc(
    float *phi, float *g, int gpoints,
    int nx, int ny, int nz
);

__global__ void gradCalc(
    float *phi, float *mod_grad, float *normx, float *normy, 
    float *normz, float *indicator, float *w, const float *cix, 
    const float *ciy, const float *ciz, int fpoints,
    int nx, int ny, int nz
);

__global__ void curvatureCalc(
    float *curvature, float *indicator, float *w,
    const float *cix, const float *ciy, const float *ciz,
    float *normx, float *normy, float *normz, 
    float *ffx, float *ffy, float *ffz, float sigma,
    int fpoints, int nx, int ny, int nz
);

__global__ void momentsCalc(
    float *ux, float *uy, float *uz, float *rho,
    float *ffx, float *ffy, float *ffz, float *w, float *f,
    const float *cix, const float *ciy, const float *ciz,
    float *pxx, float *pyy, float *pzz,
    float *pxy, float *pxz, float *pyz,
    float cssq, int nx, int ny, int nz,
    int fpoints
);

__global__ void collisionCalc(
    float *ux, float *uy, float *uz, float *w, float *w_g,
    const float *cix, const float *ciy, const float *ciz,
    float *normx, float *normy, float *normz,
    float *ffx, float *ffy, float *ffz,
    float *rho, float *phi, float *f, float *g, 
    float *pxx, float *pyy, float *pzz, float *pxy, float *pxz, float *pyz, 
    float cssq, float omega, float sharp_c, int fpoints, int gpoints,
    int nx, int ny, int nz
);

__global__ void streamingCalc(
    float *g, const float *cix, const float *ciy, const float *ciz,
    int nx, int ny, int nz, int gpoints
);

__global__ void fgBoundaryCalc(
    float *f, float *g, float *rho, float *phi, float *w, float *w_g,
    const float *cix, const float *ciy, const float *ciz,
    int fpoints, int gpoints, int nx, int ny, int nz
);

__global__ void boundaryConditions(
    float *phi, int nx, int ny, int nz
);

/*__global__ void gpuMomCollisionStreamBCS (
    float *f, float *g, float *phi, float *rho, const float *w, const float *w_g,
    const float *cix, const float *ciy, const float *ciz, 
    float *mod_grad, float *normx, float *normy, float *normz, float *indicator,
    float *curvature, float *ffx, float *ffy, float *ffz,
    float *ux, float *uy, float *uz,
    float *pxx, float *pyy, float *pzz, float *pxy, float *pxz, float *pyz,
    int nx, int ny, int nz, int fpoints, int gpoints, 
    float sigma, float cssq, float omega, float sharp_c, int nsteps
);*/

#endif
