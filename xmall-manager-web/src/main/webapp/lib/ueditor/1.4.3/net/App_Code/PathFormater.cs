
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// PathFormater 的摘要说明
/// </summary>
public static class PathFormatter
{
    public static string Format(string originFileName, string pathFormat)
    {
        if (String.IsNullOrWhiteSpace(pathFormat))
        {
            pathFormat = "{filename}{rand:6}";
        }

        var invalidPattern = new Regex(@"[\\\/\:\*\?\042\<\>\|]");
        originFileName = invalidPattern.Replace(originFileName, "");

        string extension = Path.GetExtension(originFileName);
        string filename = Path.GetFileNameWithoutExtension(originFileName);

        pathFormat = pathFormat.Replace("{filename}", filename);
        pathFormat = new Regex(@"\{rand(\:?)(\d+)\}", RegexOptions.Compiled).Replace(pathFormat, new MatchEvaluator(delegate(Match match)
        {
            var digit = 6;
            if (match.Groups.Count > 2)
            {
                digit = Convert.ToInt32(match.Groups[2].Value);
            }
            var rand = new Random();
            return rand.Next((int)Math.Pow(10, digit), (int)Math.Pow(10, digit + 1)).ToString();
        }));

        pathFormat = pathFormat.Replace("{time}", DateTime.Now.Ticks.ToString());
        pathFormat = pathFormat.Replace("{yyyy}", DateTime.Now.Year.ToString());
        pathFormat = pathFormat.Replace("{yy}", (DateTime.Now.Year % 100).ToString("D2"));
        pathFormat = pathFormat.Replace("{mm}", DateTime.Now.Month.ToString("D2"));
        pathFormat = pathFormat.Replace("{dd}", DateTime.Now.Day.ToString("D2"));
        pathFormat = pathFormat.Replace("{hh}", DateTime.Now.Hour.ToString("D2"));
        pathFormat = pathFormat.Replace("{ii}", DateTime.Now.Minute.ToString("D2"));
        pathFormat = pathFormat.Replace("{ss}", DateTime.Now.Second.ToString("D2"));

        return pathFormat + extension;
    }
}