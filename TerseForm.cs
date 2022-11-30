using System.Security.Policy;

namespace TerseNotepad
{
    public partial class TerseForm : Form
    {
        private static readonly string TERSE_FILTER = "Terse File (*.t)|*.t|All files (*.*)|*.*";
        private Dictionary<uint, string> _data = new();

        // Editor State
        private uint _priorLine = 1;
        private uint _priorColumn = 1;

        // Coordinates
        private uint _x = 1; // x = Column
        private uint _n = 1; // n = Line
        private uint _p = 1; // p = Page
        private uint _g = 1; // g = Group
        private uint _s = 1; // s = Set
        private uint _y = 1; // y = Volume
        private uint _h = 1; // h = Branch
        private uint _e = 1; // e = Language
        private uint _w = 1; // w = World
        private uint _i = 1; // i = Galaxy
        private uint _m = 1; // m = Multiverse
        public TerseForm()
        {
            InitializeComponent();
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show(@"Terse Notepad
Version 1.0

A reference editor for multi-dimensional text.

Use F2 - F11 to access additional dimensions.
", "Terse Notepad v1.0");
        }

        private void textBox_TextChanged(object sender, EventArgs e)
        {
            collectPage();
        }

        private void collectPage()
        {
            vScrollBar1.Maximum = textBox.Lines.Length;
            _data[_p] = textBox.Text;
        }

        private void loadPage()
        {
            if (!_data.ContainsKey(_p))
            {
                _data[_p] = "";
            }
            textBox.Text = _data[_p];
            _n = 1;
            _priorLine = 1;
            _priorColumn = 1;
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var dialog = new OpenFileDialog();
            dialog.Filter = TERSE_FILTER;
            var result = dialog.ShowDialog();
            if (result == DialogResult.OK)
            {
                var data = File.ReadAllText(dialog.FileName);
                var pages = data.Split("\x17\n");
                _p = 1;
                foreach ( var page in pages)
                {
                    _data[_p] = page;
                    ++_p;
                }
                _p = 1;
                loadPage();
            }
        }

        private void closeToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var text = "";
            foreach (var page in _data)
            {
                text += $"{page.Value}\x17\n";
            }
            var saver = new SaveFileDialog();
            saver.Filter = TERSE_FILTER;
            var result = saver.ShowDialog();
            if (result == DialogResult.OK)
            {
                File.WriteAllText(saver.FileName, text);
            }
        }

        private void vScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            _n = (uint)vScrollBar1.Value;
        }

        private void vScrollBar2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void textBox_SelectionChanged(object sender, EventArgs e)
        {
            _n = 1;
            var total = 0;
            //  5
            // 10
            // 20
            var offset = textBox.SelectionStart; // 34 of 35
            foreach (var line in textBox.Lines)
            {
                var delta = line.Length + 1;                
                if ((total + delta) <= offset)
                {
                    total += delta;
                    ++_n;
                    _x = 1;
                }
                else
                {
                    _x = (uint)(offset - total) + 1;
                    break;
                }
            }
            UpdateStatusBar();
        }

        private void UpdateStatusBar()
        {
            status.Text = $"Line: {_n}  Column: {_x}  Page: {_p}";
        }

        private void textBox_KeyUp(object sender, KeyEventArgs e)
        {
            int delta = 0;
            bool arrowShifted = false;

            if (!e.Shift && e.KeyCode == Keys.F2)
            {
                delta = 1;
                e.Handled = true;
            }
            if (e.Shift && e.KeyCode == Keys.F2)
            {
                delta = -1;
                e.Handled = true;
            }
            var reachedEnd = textBox.SelectionStart == textBox.TextLength &&
                textBox.Lines.Length > 0 &&             
                _priorColumn > textBox.Lines.Last().Length;
            if (!e.Shift && e.KeyCode == Keys.Right && reachedEnd)
            {
                delta = 1;
                arrowShifted = true;
                e.Handled = true;
            }
            var reachedStart = textBox.SelectionStart == 0 &&
                               _priorColumn == 1;
            if (!e.Shift && e.KeyCode == Keys.Left && reachedStart)
            {
                delta = -1;
                arrowShifted = true;
                e.Handled = true;
            }
            if (!e.Shift && e.KeyCode == Keys.Down && _priorLine == _n)
            {
                delta = 1;
                arrowShifted = true;
                e.Handled = true;
            }
            if (!e.Shift && e.KeyCode == Keys.Up && _priorLine == 1)
            {
                delta = -1;
                arrowShifted = true;
                e.Handled = true;
            }
            if (delta != 0)
            {
                collectPage();
                if (delta > 0) { ++_p; }
                if (delta < 0) { --_p; }
                if (_p < 1) { _p = 1; }
                loadPage();
                if (arrowShifted)
                {
                    if (delta < 0)
                    {
                        textBox.SelectionStart = textBox.TextLength > 1 ? textBox.TextLength - 1 : 0;
                    }
                    if (delta > 0)
                    {
                        textBox.SelectionStart = 0;
                    }
                }
                UpdateStatusBar();
            }
        }

        private void textBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (_priorLine != _n)
            {
                _priorLine = _n;
            }
            if (_priorColumn != _x)
            {
                _priorColumn = _x;
            }
        }
    }
}