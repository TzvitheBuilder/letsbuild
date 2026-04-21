import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm'

const SUPABASE_URL = 'https://zqiwieykryhjpijwseij.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpxaXdpZXlrcnloanBpandzZWlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzYxOTk1MzQsImV4cCI6MjA5MTc3NTUzNH0.U8OEsvKC7A95LMxdj12yQ9hbShUsUiAo0V_LUgm-xA0'

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)