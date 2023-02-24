using Microsoft.JSInterop;

namespace InnspireAdminConsole.Services
{
    public class PageLayoutService
    {
        private readonly IJSRuntime jsRuntime;

        public async Task ToggleSidebar()
        {
            await jsRuntime.InvokeVoidAsync("toggleSidebar");
        }

        public PageLayoutService(IJSRuntime jsRuntime)
        {
            this.jsRuntime = jsRuntime;
        }
    }
}
