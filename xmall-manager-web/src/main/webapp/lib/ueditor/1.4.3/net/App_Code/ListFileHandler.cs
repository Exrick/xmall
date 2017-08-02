using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// FileManager 的摘要说明
/// </summary>
public class ListFileManager : Handler
{
    enum ResultState
    {
        Success,
        InvalidParam,
        AuthorizError,
        IOError,
        PathNotFound
    }

    private int Start;
    private int Size;
    private int Total;
    private ResultState State;
    private String PathToList;
    private String[] FileList;
    private String[] SearchExtensions;

    public ListFileManager(HttpContext context, string pathToList, string[] searchExtensions)
        : base(context)
    {
        this.SearchExtensions = searchExtensions.Select(x => x.ToLower()).ToArray();
        this.PathToList = pathToList;
    }

    public override void Process()
    {
        try
        {
            Start = String.IsNullOrEmpty(Request["start"]) ? 0 : Convert.ToInt32(Request["start"]);
            Size = String.IsNullOrEmpty(Request["size"]) ? Config.GetInt("imageManagerListSize") : Convert.ToInt32(Request["size"]);
        }
        catch (FormatException)
        {
            State = ResultState.InvalidParam;
            WriteResult();
            return;
        }
        var buildingList = new List<String>();
        try
        {
            var localPath = Server.MapPath(PathToList);
            buildingList.AddRange(Directory.GetFiles(localPath, "*", SearchOption.AllDirectories)
                .Where(x => SearchExtensions.Contains(Path.GetExtension(x).ToLower()))
                .Select(x => PathToList + x.Substring(localPath.Length).Replace("\\", "/")));
            Total = buildingList.Count;
            FileList = buildingList.OrderBy(x => x).Skip(Start).Take(Size).ToArray();
        }
        catch (UnauthorizedAccessException)
        {
            State = ResultState.AuthorizError;
        }
        catch (DirectoryNotFoundException)
        {
            State = ResultState.PathNotFound;
        }
        catch (IOException)
        {
            State = ResultState.IOError;
        }
        finally
        {
            WriteResult();
        }
    }

    private void WriteResult()
    {
        WriteJson(new
        {
            state = GetStateString(),
            list = FileList == null ? null : FileList.Select(x => new { url = x }),
            start = Start,
            size = Size,
            total = Total
        });
    }

    private string GetStateString()
    {
        switch (State)
        {
            case ResultState.Success:
                return "SUCCESS";
            case ResultState.InvalidParam:
                return "参数不正确";
            case ResultState.PathNotFound:
                return "路径不存在";
            case ResultState.AuthorizError:
                return "文件系统权限不足";
            case ResultState.IOError:
                return "文件系统读取错误";
        }
        return "未知错误";
    }
}