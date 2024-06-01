-- Custom Parameters (with defaults)
return {
    "David-Kunz/gen.nvim",
   config = function()
        require("gen").setup({
            -- The default model to use.
            model = "llama3",
            -- The host running the Ollama service.
            host = "localhost",
            -- The port on which the Ollama service is listening.
            port = "11434",
            -- set keymap for close the response window
            quit_map = "q",
            -- set keymap to re-send the current prompt
            retry_map = "<c-r>",
            -- Function to initialize Ollama
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            -- The display mode. Can be "float" or "split".
            display_mode = "split",
            -- Shows the prompt submitted to Ollama.
            show_prompt = false,
            -- Displays which model you are using at the beginning of your chat session.
            show_model = true,
            -- Never closes the window automatically.
            no_auto_close = false,
            -- Prints errors and the command which is run.
            debug = false
        })
        vim.keymap.set({ 'n', 'v' }, '<leader>ge', ':Gen<CR>')
    end
}
