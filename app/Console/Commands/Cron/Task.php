<?php

namespace App\Console\Commands\Cron;

use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class Task extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:calculate-installment-fine';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();



    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //


            DB::table('users')->update(['todaynumber'=>0]);
             DB::table('user_task')->update(['status'=>1]);


    }
}
