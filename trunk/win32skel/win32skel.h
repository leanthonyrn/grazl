
// Global:
#define WINDOW_NAME   TEXT("My Window")
#define WINDOW_WIDTH  640
#define WINDOW_HEIGHT 480

// Window management:
void RegisterWindowClass (HINSTANCE hInst);
void CreateAndDisplayWindow (HINSTANCE hInst);
void ResizeClientWindow (HWND hWnd, UINT nWidth, UINT nHeight);

// Events:
LRESULT CALLBACK WndProc (HWND, UINT, WPARAM, LPARAM);

bool OnCreate (HWND hWnd, LPCREATESTRUCT lpcs);
void OnPaint (HWND hWnd);
void OnDestroy (HWND hWnd);

