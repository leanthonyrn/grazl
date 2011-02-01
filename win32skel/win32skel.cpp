
// Grazl.
// Public domain.
// Intended for use in 64kb games/demos.

#include <windows.h>
#include <windowsx.h>
#include "win32skel.h"

bool OnCreate (HWND hWnd, LPCREATESTRUCT lpcs) {

  // Load resources here.
  return true; }

void OnPaint (HWND hWnd) {
  PAINTSTRUCT ps;
  HDC hdc = BeginPaint(hWnd, &ps);

  // Draw here, use double-buffering to prevent tearing
  // unless you are manipulating pixels directly and using StretchDIBits.
  EndPaint(hWnd, &ps); }

void OnDestroy (HWND hWnd) {
  
  // Clear resources here.
  PostQuitMessage(0); }

// Register the window class via WinAPI.
void RegisterWindowClass (HINSTANCE hInst) {
   WNDCLASS wc;

   wc.style          = CS_HREDRAW | CS_VREDRAW;
   wc.lpfnWndProc    = WndProc;
   wc.cbClsExtra     = 0;
   wc.cbWndExtra     = 0;
   wc.hInstance      = hInst;
   wc.hIcon          = LoadIcon(NULL, IDI_APPLICATION);
   wc.hCursor        = LoadCursor(NULL, IDC_ARROW);
   wc.hbrBackground  = (HBRUSH) GetStockObject(GRAY_BRUSH);
   wc.lpszMenuName   = NULL;
   wc.lpszClassName  = WINDOW_NAME;

   RegisterClass(&wc); }

// Create the window.
void CreateAndDisplayWindow (HINSTANCE hInst) {
   HWND hWnd;

   hWnd = CreateWindow(
       WINDOW_NAME,
       WINDOW_NAME,
       WS_OVERLAPPEDWINDOW & ~WS_SIZEBOX & ~WS_MAXIMIZEBOX,
       CW_USEDEFAULT, CW_USEDEFAULT,
       CW_USEDEFAULT, CW_USEDEFAULT,
       NULL,
       NULL,
       hInst,
       NULL);
	
   // Resolution:
   ResizeClientWindow(hWnd, WINDOW_WIDTH, WINDOW_HEIGHT);

   ShowWindow(hWnd, SW_SHOWNORMAL);
   UpdateWindow(hWnd); }

// Resize the window with respect to the client area.
void ResizeClientWindow (HWND hWnd, UINT nWidth, UINT nHeight) {
  RECT rcClient, rcWindow;

  GetClientRect(hWnd, &rcClient);
  GetWindowRect(hWnd, &rcWindow);

  MoveWindow(hWnd, rcWindow.left, rcWindow.top,
             nWidth  + (rcWindow.right  - rcWindow.left) - rcClient.right,
             nHeight + (rcWindow.bottom - rcWindow.top)  - rcClient.bottom,
             FALSE); }

// Program entry point.
INT WINAPI WinMain (HINSTANCE hInst, HINSTANCE, PSTR, INT iCmdShow) {
   RegisterWindowClass(hInst);
   CreateAndDisplayWindow(hInst);

   MSG msg;
   while (GetMessage(&msg, NULL, 0, 0)) {
      TranslateMessage(&msg);
      DispatchMessage(&msg); }
   
   return msg.wParam; }

// Message loop callback for the main window.
LRESULT CALLBACK WndProc (HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam) {
   switch(message) {
     HANDLE_MSG(hWnd, WM_CREATE,  OnCreate);
     HANDLE_MSG(hWnd, WM_PAINT,   OnPaint);
     HANDLE_MSG(hWnd, WM_DESTROY, OnDestroy); }
  
   return DefWindowProc(hWnd, message, wParam, lParam); }

