<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use DB;
class TaskController extends Controller
{
    //

    public function list()
    {
        $user = auth('api')->user();
        $task= $user->task()->get();
        return $this->success($task);
    }
    //完成任务;领取积分
    public function gain(Request $request)
    {
        $user = auth('api')->user();
        $data = $request->all();
        if (!$request->has('task_id')) {
            return $this->failed('错误');
        }else{
            $gain= $user->task()->find($data['task_id']);
            $res=DB::table('users')->where('id',$user['id'])->update(['integral'=>$user['integral']+$gain['integral']]);
           $user->task()->updateExistingPivot($data['task_id'],['status'=>3]);
            if($res){
                return $this->success('完成成功');
            }else{
                return $this->success('失败');
            };
        }


    }
}
