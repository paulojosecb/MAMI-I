using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour
{

    private int tAtual;
    public const int velocity = 1;
    private int position;

    public GameObject player;
    
    // Start is called before the first frame update

    void Start()
    {

        player = GameObject.FindGameObjectWithTag("Player");

        tAtual = 0;
        position = (int)player.transform.position.x;

        QualitySettings.vSyncCount = 0;
        Application.targetFrameRate = 1;
        
    }

    // Update is called once per frame
    void Update()
    {
        this.position = mru(velocity, this.tAtual);
        print(position);
        this.tAtual++;

        player.transform.position = new Vector2(position, player.transform.position.y);
    }

    int mru(int velocity, int time) {
        return velocity * time;
    }
}
